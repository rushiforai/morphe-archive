.class public LX/dپΡΩ丯乍乡ظ乣丿丳э丟юΓЧгب世Λ乗乊乛专;
.super Ljava/lang/Object;

.method public static a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/io/InputStream;
    .locals 5

    check-cast p2, Ljava/io/InputStream;
    invoke-static {p1, p2}, LX/LocalSponsoredFilter;->stream(Ljava/lang/Object;Ljava/io/InputStream;)Ljava/io/InputStream;
    move-result-object p2

    :try_start_0
    # Preserve this APK's direct module-provider call; older reflection targets
    # and string-decoder IDs belong to the previous app build.
    invoke-static {}, LX/rζ両ОуοΖ且乀丬З乔丗乎М下不μ业дпξ专ο;->get()LX/q三پ世ъΘшΑ丳丵丞νΜبдЦЩΠδنМ世ء个;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2}, LX/q三پ世ъΘшΑ丳丵丞νΜبдЦЩΠδنМ世ء个;->call(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    :cond_0
    check-cast p2, Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :catch_0
    move-exception p0

    invoke-static {p0}, LX/lк乂丩хЫ乡丠φ丵世Χд举τ久丿乤丳丞丠к乢乚;->b(Ljava/lang/Exception;)V

    check-cast p2, Ljava/io/InputStream;

    return-object p2
.end method
