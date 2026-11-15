# UI and long-press regression tests

Compile the extension Java helpers into a JAR and run these JUnit 4 tests with Robolectric 4.14.1, Android SDK 28, and `org.json:json:20260814`.

`Ui191Test` checks blank-area tab gestures, nested horizontal and vertical scrolling, fixed playlist and NG-list actions, managed NG inputs, and dark/light surface handling while retaining image pixels.

`PopupHold191Test` checks the 500 ms minimum popup hold, release/movement/cancellation, a fresh press after cancellation, longer framework delays, and accessibility long clicks.

These tests run Android view dispatch and layout through Robolectric. They supplement device checks for the actual theme resources, animation, touch feel, font scale, and the native list adapter.
