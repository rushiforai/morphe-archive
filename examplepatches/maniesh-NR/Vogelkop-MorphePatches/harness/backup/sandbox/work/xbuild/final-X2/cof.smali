.class public final enum Lcof;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final synthetic d:[Lcof;

.field public static final synthetic e:Lh58;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    new-instance v0, Lcof;

    const v4, 0x7f14073b

    const-string v5, "https://www.facebook.com/Opera/"

    const-string v1, "FACEBOOK"

    const/4 v2, 0x0

    const v3, 0x7f080488

    invoke-direct/range {v0 .. v5}, Lcof;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    new-instance v1, Lcof;

    const v5, 0x7f140a46

    const-string v6, "https://twitter.com/opera"

    const-string v2, "TWITTER"

    const/4 v3, 0x1

    const v4, 0x7f080734

    invoke-direct/range {v1 .. v6}, Lcof;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    new-instance v2, Lcof;

    const v6, 0x7f140a44

    const-string v7, "https://www.instagram.com/opera/"

    const-string v3, "INSTAGRAM"

    const/4 v4, 0x2

    const v5, 0x7f0804a4

    invoke-direct/range {v2 .. v7}, Lcof;-><init>(Ljava/lang/String;IIILjava/lang/String;)V

    filled-new-array {v0, v1, v2}, [Lcof;

    move-result-object v0

    sput-object v0, Lcof;->d:[Lcof;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lcof;->e:Lh58;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;)V
    .registers 6

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcof;->a:I

    iput p4, p0, Lcof;->b:I

    iput-object p5, p0, Lcof;->c:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcof;
    .registers 2

    const-class v0, Lcof;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcof;

    return-object p0
.end method

.method public static values()[Lcof;
    .registers 1

    sget-object v0, Lcof;->d:[Lcof;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcof;

    return-object v0
.end method
