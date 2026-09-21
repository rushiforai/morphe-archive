# Talk 243 regression check

These JVM fixtures check generated-cache invalidation, integrity-state normalization,
direct digest invocation, and normal reflection fallback behavior. They do not verify
server acceptance.

```powershell
javac -d output/talk243-tests/classes scripts/talk243/o/setExtras.java scripts/talk243/o/isAtLeastJellyBeanMR1.java scripts/talk243/o/isAtLeastJellyBeanMR1`$RemoteActionCompatParcelizer.java extensions/chmate/src/main/java/app/morphe/extension/chmate/TalkPostCompatibility.java scripts/talk243/VerifyTalkPost.java
java -cp output/talk243-tests/classes VerifyTalkPost
```

The 243 runtime class `o.isAtLeastJellyBeanMR1.c(String)` calculates a valid digest through
`o.isAtLeastJellyBeanMR1$RemoteActionCompatParcelizer.a()`, then enters certificate-derived
integrity arithmetic. A re-signed APK reaches an intentional invalid-array path or a huge
allocation after the digest calculation. The patch intercepts only this reflected Talk token
call in `o.zzaat` and invokes the digest callable without the failing integrity wrapper.
