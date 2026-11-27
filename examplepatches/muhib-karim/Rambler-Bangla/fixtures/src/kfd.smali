.class public Lkfd;
.super Ljava/lang/Object;

# Fixture stand-in for the stock cleanup builder:
#   Lkfd;->d(Lhrl;Ljava/lang/String;ILqqi;Laebb;Ljava/lang/String;
#            Laugd;Ljava/util/concurrent/atomic/AtomicBoolean;)V
# p1 plays the role of the cleanup prompt assembled by the caller.
.method public static d(Lhrl;Ljava/lang/String;ILqqi;Laebb;Ljava/lang/String;Laugd;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 3

    const-string v1, "{ENABLED_LANGUAGES}"
    const-string v2, "bn-BD,en-US"
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "{HINGLISH_OVERRIDE_RULE}"
    const-string v2, "3. Hinglish Override: For any combination of Indian languages (e.g., Hindi, Bengali, Marathi, Kannada, etc.) and English, override all native script defaults. Transcribe and edit exclusively in Romanized script (Hinglish/Banglish). Example: Use \"Aap kaise ho?\" instead of the native-script form."
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v0

    invoke-static {v0}, Lkew;->a(Ljava/lang/String;)V
    return-void
.end method
