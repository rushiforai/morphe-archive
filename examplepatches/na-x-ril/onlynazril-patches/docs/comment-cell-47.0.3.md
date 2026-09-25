# Comment component, TikTok 47.0.3

> **Which cell this is about.** The comment list in this build is rendered by
> `com.ss.android.ugc.aweme.commentv2.commentlist.powercell.BaseCommentCell`, not by the
> `now.interaction.CommentCell` dumped below. The name render's frames name the chain:
> `User#getNickname <- X.0939#LIZ <- X.0IQF#LJFF <- BaseCommentCell#R5 <- BaseCommentCell#W6
> <- CommentSecondaryItemCell#J8 <- CommentSecondaryItemCell#onBindItemView`.
> Its comments' time is written in `G8(I,Z)` (two branches, both from `Comment#getCreateTime`), and
> every view id in it is obfuscated (`epa`, `n76`, `ifm`, …).
>
> The dump below is kept for two reasons: `now.interaction.CommentCell` is a second comment cell in
> this APK, and its layout ids are readable, which makes it the clearest example of the shape. What
> the patch does now is in `CommentDateBridge`: the region is read from the comment at the time
> write, not looked up in a view.

How to reproduce the dump:

```
./tools/smaliprobe/run.sh "<apk>" com.ss.android.ugc.now.interaction.assem.CommentCell
```

DexKit is not enough for this: its `MethodData` stops at opcodes, while a hook has to know which
register holds the view and which holds the text.

## Class shape

`com.ss.android.ugc.now.interaction.assem.CommentCell` (in `classes31.dex` on this APK), extends
`Lcom/bytedance/ies/powerlist/PowerCell;`, 20 registers, 12 methods.

Fields that matter:

| field | type | holds |
|---|---|---|
| `LLJLLIL` | `User` | the comment author being bound |
| `LLJLLL` | `Comment` | the comment being bound |
| `LLJJJ`, `LLJJJIL` | `LX/02nl;` | lazy holders for the two name text views |

## Its views

| getter | returns | used for |
|---|---|---|
| `V5()` | `TuxTextView` | **the commenter's name** |
| `X5()` | `TuxTextView` | the replied-to name (`Comment#getReplyToNickName`) |
| `U5()` | `LX/0xr8` | the comment body (it has `setMentionSpanColor`, so mention spans are handled there) |
| `R5(TuxTextView)` | `int` | measures text width (`getPaint().measureText`) |
| `Q5()` | `CommentListVM` | the view model |

`onCreateItemView` inflates layout `2131563167` (`0x7f0d129f`), and `onItemViewCreated` hands that
item view to the binding wrapper `LX/1FDm` (`LX/00su;->LIZ(View, LX/00sv;)`). The views are therefore
cached in lazy fields rather than looked up per bind — `V5()` reads the holder, it does not call
`findViewById`.

## The name write, and the four other writes

`onBindItemView(LX/05tf;)V`, 277 instructions, five `setText` sites:

| instruction | writes | source |
|---|---|---|
| 35 | the commenter's name | `User#getNickname()` (instruction 31) — **the one the patch used** |
| 108 | the replied-to name | `Comment#getReplyToNickName()` |
| 147 | the comment body | `Comment#getText()` |
| 173 | the comment's time | `Comment#getCreateTime()` → `LX/0J7I;->LJFF(J)` |
| — | (a fifth, outside the dumped window) | — |

The window around the name:

```
22  invoke-virtual {v5}, Lcom/ss/android/ugc/now/interaction/assem/CommentCell;->V5()Lcom/bytedance/tux/input/TuxTextView;
23  move-result-object v2                                # v2 = the name TextView
...
31  invoke-virtual {v1}, Lcom/ss/android/ugc/aweme/profile/model/User;->getNickname()Ljava/lang/String;
32  move-result-object v0                                # the text from our hook
33  if-eqz v0 ...
34  move-object {v6, v0}
35  invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
```

`v2` is untouched between 23 and 35, so hooking at `35 + 1` is safe, and the register is read from
instruction 35 itself (`registerC`) rather than written down by hand.

## Its layout: `res/b/cp9.xml` (logical name `layout/cyh`)

Paths inside the APK are obfuscated (AGP resource path shortening), so the ids are what is useful.
To find them: `aapt2 dump resources "<apk>" | grep 0x7f0d129f` gives the real file name, then
`aapt2 dump xmltree "<apk>" --file res/b/cp9.xml`.

The name row is one `RelativeLayout` with exactly three children:

| child | id | holds |
|---|---|---|
| 1 | `id/tv_name` | **the commenter's name** |
| 2 | `id/uby` (id name obfuscated) | a `LinearLayout` with a `TuxIconView` (`raw/icon_arrow_triangle_right_fill_ltr`, 16dp) and `id/tv_reply_name` |
| 3 | `id/tv_date` | the comment's time, written from `Comment#getCreateTime()` at instruction 173 |

Two things worth keeping from this:

- **No verified badge and no "Creator" label in this layout.** If both are visible on a device, this
  is not the cell being rendered — or the badge is added programmatically by the binding. That is why
  the `name render on comments: … via <frames>` log line is worth reading before guessing.
- **`id/tv_date` sits in the same row as the name, already dimmed.** That is where the region goes:
  it rides with the time, takes the time view's colour, and leaves the name clean — the same
  arrangement the feed uses, so a comment and the feed now handle a region identically.

## What cannot be changed from here

The verified badge and the "Creator" label do not appear in `CommentCell`'s code: no `ImageView`, no
verification state, and no branch that adds either to the name. When both are on screen, their source
is outside this method. All that can be changed from these hooks is how the name's own text is drawn
and what is written next to it — which is why the region is written into the time view instead of
being appended to the name.
