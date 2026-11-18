# Notes on the patch framework

Things about the framework that are not in its documentation and that cost
time to find out. They are written down here because the next patch will run
into them too.

## Replacing a call with a block of instructions

`replaceInstructions` does not replace one instruction with a block. It removes
as many instructions as the block holds, and puts the block in their place. A
block that is longer than what follows the call takes the instructions that
follow it with it, and the method ends up wrong in a way that is hard to see.

The helper in `core/BytecodeEdits.kt` therefore removes the call on its own
and puts the block in its place. That is two steps, and each of them does what
it says.

## Labels inside a block of instructions

A label inside an inserted block is placed at the offset the label has inside
the block, counted from the start of the method, and not from the place the
block was put in. A branch to such a label therefore points at the wrong
instruction, and the verifier refuses the result with an error about a move
instruction being used as a branch target.

Labels inside an inserted block are not to be used. What to use instead:

- an answer that is the same size as the call it replaces, such as a constant
  in the place of the answer of the call;
- a change of a text, such as the text of a statement of the data access
  layer, which is a change of one instruction for one instruction and needs no
  branch at all.

A branch is fine in a method that already has one: the patch can flip the
condition of an existing branch by answering the comparison with a constant.

## Where the changed classes end up

The changed classes are written into a new dex file, and they are taken out of
the dex they were in. The class that runs is therefore the changed one, and
the order of the dex files does not hide it. The new dex file is added to the
application at the end, which is why a patched application has one dex file
more than the one it was built from.

An application that is split into several packages has one dex file per
package. A patch that touches a class of a package other than the one of the
base package is applied to the base package alone and has no effect on the
device, because the class that runs is the one of the split.

## Reading the result

The class that was changed can be read back out of the patched dex with
`dexdump` from the build tools of the Android SDK. It is the quickest way to
see whether an edit did what it was meant to do, and the output carries the
offsets of the instructions, so a branch can be checked by hand.

## The device

- `adb shell input text` drops a `#`. Send it as `adb shell input keyevent
  18` instead, which is the key code of the pound sign.
- The application has to be started the way the launcher starts it, with
  `monkey -p <package> -c android.intent.category.LAUNCHER 1`. Naming the
  splash activity on its own leaves the application waiting on a blank
  screen, with the stock build as well.
- The patched base package is put over the installed one with a bind mount,
  which keeps the signature of the stock build and with it the services that
  are bound to it. The mount is taken away with `umount -l`, because a plain
  `umount` is refused while the application runs.
- **The compiled image of the application has to be removed after every new
  build is put over it.** The application is compiled ahead of time into
  `oat/arm64` of its own directory, and that image is of the build that was
  installed. While it is there, the application runs the code of the stock
  build and a patch that is in the dex has no effect. Removing the directory
  with `rm -rf <appdir>/oat` makes the application compile itself from the
  dex that is mounted, which takes a while the first time.

## A statement of the data access layer

A statement of the data access layer is a text in the dex, and it is the
easiest thing in an application to change without a branch. Two things have to
be counted before it is changed: the number of values and the number of
columns have to stay the same, and a value that holds a subquery of the same
table has to be written so that it is read before the row is replaced.
