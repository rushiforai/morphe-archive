# Popular popup ownership regression

Compile these isolated Android/native stubs and `PopularMembershipTest.java` together with the production `PopularNativeRows.java` into a dedicated output directory, then run `app.morphe.extension.chmate.PopularMembershipTest`. Do not put these stubs on an application classpath.

The fixture uses 10,000 native-like responses and 100 small popups. It checks that popup ownership needs one row read per popup, retains the full parent snapshot, preserves standard selection, and uses object identity instead of value equality. This is not device/UI verification.
