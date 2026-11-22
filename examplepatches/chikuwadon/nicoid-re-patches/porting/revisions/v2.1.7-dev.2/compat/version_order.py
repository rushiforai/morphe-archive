"""Crash-safe game-record version comparator for all three Bike Run modes.

A prerelease like 1.5.0-dev.15 cannot be passed to BigInteger directly.
The preexisting comparator uses the first three numeric version components.
Keep its comparison order, but gracefully parse missing/non-numeric segments.
"""


def patch(content, owner):
    comparator = owner + "Records$2;"
    entry = owner + "Records$Entry;"
    old_start = (".method public compare(" + entry + entry + ")I")
    start = content.find(old_start)
    if start < 0 or content.count(old_start) != 1:
        raise ValueError("Expected exactly one record comparator: " + comparator)
    end = content.find(".end method", start)
    if end < 0:
        raise ValueError("Comparator is unterminated")
    end += len(".end method")
    method = r"""
.method public compare("""+entry+entry+r""")I
    .registers 9
    iget-object v4, p1, """+entry+r"""->version:Ljava/lang/String;
    iget-object v5, p2, """+entry+r"""->version:Ljava/lang/String;
    const/4 v0, 0x0
    :sort_loop
    const/4 v1, 0x3
    if-ge v0, v1, :sort_equal
    invoke-static {v4, v0}, """+comparator+r"""->numericPart(Ljava/lang/String;I)Ljava/math/BigInteger;
    move-result-object v2
    invoke-static {v5, v0}, """+comparator+r"""->numericPart(Ljava/lang/String;I)Ljava/math/BigInteger;
    move-result-object v3
    invoke-virtual {v3, v2}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I
    move-result v1
    if-eqz v1, :sort_next
    return v1
    :sort_next
    add-int/lit8 v0, v0, 0x1
    goto :sort_loop
    :sort_equal
    const/4 v0, 0x0
    return v0
.end method
"""
    helper = r"""
.method private static numericPart(Ljava/lang/String;I)Ljava/math/BigInteger;
    .registers 8
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;
    if-eqz p0, :version_default
    const-string v1, "\\."
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
    if-gez p1, :version_bounds
    goto :version_default
    :version_bounds
    array-length v2, v1
    if-ge p1, v2, :version_default
    aget-object v2, v1, p1
    # Strip any 'v' prefix and any '-dev.N' / other prerelease suffix.
    const-string v3, "^[^0-9]*"
    const-string v4, ""
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    const-string v3, "[^0-9].*$"
    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z
    move-result v3
    if-nez v3, :version_default
    new-instance v0, Ljava/math/BigInteger;
    invoke-direct {v0, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V
    :version_default
    return-object v0
.end method
"""
    return content[:start] + method + content[end:] + "\n" + helper
