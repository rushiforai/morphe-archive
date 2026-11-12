.class public final enum Lc16;
.super Ljava/lang/Enum;
.source "SourceFile"

# interfaces
.implements Lks2;


# static fields
.field public static final synthetic c:[Lc16;

.field public static final synthetic d:Lh58;


# instance fields
.field public final a:Ljava/util/Set;

.field public final b:Lnf2;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lc16;

    const-string v1, "email"

    const-string v2, "emailAddress"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    sget-object v2, Lnf2;->e:Lnf2;

    const-string v3, "EMAIL"

    const/4 v4, 0x0

    invoke-direct {v0, v3, v4, v1, v2}, Lc16;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v1, Lc16;

    const-string v2, "impp"

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    sget-object v3, Lnf2;->f:Lnf2;

    const-string v4, "IMPP"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2, v3}, Lc16;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v2, Lc16;

    const-string v3, "newUsername"

    invoke-static {v3}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    sget-object v4, Lnf2;->l:Lnf2;

    const-string v5, "NEW_USERNAME"

    const/4 v6, 0x2

    invoke-direct {v2, v5, v6, v3, v4}, Lc16;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v3, Lc16;

    const-string v4, "newPassword"

    invoke-static {v4}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    sget-object v5, Lnf2;->m:Lnf2;

    const-string v6, "NEW_PASSWORD"

    const/4 v7, 0x3

    invoke-direct {v3, v6, v7, v4, v5}, Lc16;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v4, Lc16;

    const-string v5, "passwordAuto"

    const-string v6, "password"

    const-string v7, "current-password"

    filled-new-array {v7, v5, v6}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v5

    sget-object v6, Lnf2;->g:Lnf2;

    const-string v7, "PASSWORD"

    const/4 v8, 0x4

    invoke-direct {v4, v7, v8, v5, v6}, Lc16;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    new-instance v5, Lc16;

    const-string v6, "webauthn"

    const-string v7, "username"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v6

    sget-object v7, Lnf2;->h:Lnf2;

    const-string v8, "USERNAME"

    const/4 v9, 0x5

    invoke-direct {v5, v8, v9, v6, v7}, Lc16;-><init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V

    filled-new-array/range {v0 .. v5}, [Lc16;

    move-result-object v0

    sput-object v0, Lc16;->c:[Lc16;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lc16;->d:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/util/Set;Lnf2;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lc16;->a:Ljava/util/Set;

    iput-object p4, p0, Lc16;->b:Lnf2;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lc16;
    .registers 2

    const-class v0, Lc16;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lc16;

    return-object p0
.end method

.method public static values()[Lc16;
    .registers 1

    sget-object v0, Lc16;->c:[Lc16;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lc16;

    return-object v0
.end method


# virtual methods
.method public final d()Lnf2;
    .registers 1

    iget-object p0, p0, Lc16;->b:Lnf2;

    return-object p0
.end method

.method public final g()Ljava/util/Set;
    .registers 1

    iget-object p0, p0, Lc16;->a:Ljava/util/Set;

    return-object p0
.end method
