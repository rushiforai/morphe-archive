.class public abstract Lnicoid/network238/kotlin/enums/EnumEntriesKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final enumEntries([Ljava/lang/Enum;)Lnicoid/network238/kotlin/enums/EnumEntries;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    new-instance v0, Lnicoid/network238/kotlin/enums/EnumEntriesList;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/enums/EnumEntriesList;-><init>([Ljava/lang/Enum;)V

    return-object v0
.end method
