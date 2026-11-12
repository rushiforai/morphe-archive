.class public enum Lfrj;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final d:Ldrj;

.field public static final enum e:Lfrj;

.field public static final enum f:Lfrj;

.field public static final enum g:Lerj;

.field public static final synthetic h:[Lfrj;

.field public static final synthetic i:Lh58;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:B


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lfrj;

    const v3, 0x7f141142

    const/4 v4, 0x2

    const-string v1, "EMAIL"

    const/4 v2, 0x0

    const-string v5, "android.intent.action.SENDTO"

    invoke-direct/range {v0 .. v5}, Lfrj;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    sput-object v0, Lfrj;->e:Lfrj;

    new-instance v1, Lfrj;

    const v4, 0x7f141141

    const/4 v5, 0x4

    const-string v2, "PHONE"

    const/4 v3, 0x1

    const-string v6, "android.intent.action.DIAL"

    invoke-direct/range {v1 .. v6}, Lfrj;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    sput-object v1, Lfrj;->f:Lfrj;

    new-instance v2, Lerj;

    const v5, 0x7f141143

    const/4 v6, 0x1

    const-string v3, "URL"

    const/4 v4, 0x2

    const-string v7, "android.intent.action.VIEW"

    invoke-direct/range {v2 .. v7}, Lfrj;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    sput-object v2, Lfrj;->g:Lerj;

    const/4 v3, 0x3

    new-array v3, v3, [Lfrj;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    sput-object v3, Lfrj;->h:[Lfrj;

    new-instance v0, Lh58;

    invoke-direct {v0, v3}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v0, Lfrj;->i:Lh58;

    new-instance v0, Ldrj;

    invoke-direct {v0, v4}, Ldrj;-><init>(B)V

    sput-object v0, Lfrj;->d:Ldrj;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p5, p0, Lfrj;->a:Ljava/lang/String;

    iput p3, p0, Lfrj;->b:I

    iput-byte p4, p0, Lfrj;->c:B

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lfrj;
    .registers 2

    const-class v0, Lfrj;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lfrj;

    return-object p0
.end method

.method public static values()[Lfrj;
    .registers 1

    sget-object v0, Lfrj;->h:[Lfrj;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfrj;

    return-object v0
.end method


# virtual methods
.method public d(Landroid/content/Context;Landroid/net/Uri;)Landroid/content/Intent;
    .registers 3

    new-instance p1, Landroid/content/Intent;

    iget-object p0, p0, Lfrj;->a:Ljava/lang/String;

    invoke-direct {p1, p0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method
