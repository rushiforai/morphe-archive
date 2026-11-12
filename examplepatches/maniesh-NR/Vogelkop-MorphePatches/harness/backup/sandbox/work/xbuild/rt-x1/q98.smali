.class public final enum Lq98;
.super Ljava/lang/Enum;
.source "SourceFile"


# static fields
.field public static final f:Lwu5;

.field public static final enum g:Lq98;

.field public static final enum h:Lq98;

.field public static final enum i:Lq98;

.field public static final synthetic j:[Lq98;

.field public static final synthetic k:Lh58;


# instance fields
.field public final a:B

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Lpxh;

.field public final e:Lrxh;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lq98;

    sget-object v1, Ln98;->a:Ln98;

    invoke-static {v1}, Lcqp;->Y(Ln98;)Lpxh;

    move-result-object v6

    invoke-static {v1}, Lcqp;->X(Ln98;)Lrxh;

    move-result-object v7

    const-string v1, "FREE_PROMOTION"

    const/4 v2, 0x0

    const/4 v3, 0x1

    const v4, 0x7f0a03ca

    const-string v5, "local_free_esim_promo"

    invoke-direct/range {v0 .. v7}, Lq98;-><init>(Ljava/lang/String;IIILjava/lang/String;Lpxh;Lrxh;)V

    sput-object v0, Lq98;->g:Lq98;

    new-instance v1, Lq98;

    sget-object v2, Ln98;->b:Ln98;

    invoke-static {v2}, Lcqp;->Y(Ln98;)Lpxh;

    move-result-object v7

    invoke-static {v2}, Lcqp;->X(Ln98;)Lrxh;

    move-result-object v8

    const-string v2, "PAID_PROMOTION"

    const/4 v4, 0x2

    const v5, 0x7f0a03ca

    const-string v6, "local_paid_esim_promo"

    invoke-direct/range {v1 .. v8}, Lq98;-><init>(Ljava/lang/String;IIILjava/lang/String;Lpxh;Lrxh;)V

    sput-object v1, Lq98;->h:Lq98;

    new-instance v2, Lq98;

    new-instance v8, Lrxh;

    const v3, 0x7f1406d3

    invoke-direct {v8, v3}, Lrxh;-><init>(I)V

    new-instance v9, Lrxh;

    const v3, 0x7f1406d2

    invoke-direct {v9, v3}, Lrxh;-><init>(I)V

    const-string v3, "UPSELL"

    const/4 v5, 0x3

    const v6, 0x7f0a03cd

    const-string v7, "local_free_upsell"

    invoke-direct/range {v2 .. v9}, Lq98;-><init>(Ljava/lang/String;IIILjava/lang/String;Lpxh;Lrxh;)V

    sput-object v2, Lq98;->i:Lq98;

    filled-new-array {v0, v1, v2}, [Lq98;

    move-result-object v0

    sput-object v0, Lq98;->j:[Lq98;

    new-instance v1, Lh58;

    invoke-direct {v1, v0}, Lh58;-><init>([Ljava/lang/Enum;)V

    sput-object v1, Lq98;->k:Lh58;

    new-instance v0, Lwu5;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lq98;->f:Lwu5;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIILjava/lang/String;Lpxh;Lrxh;)V
    .registers 8

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-byte p3, p0, Lq98;->a:B

    iput p4, p0, Lq98;->b:I

    iput-object p5, p0, Lq98;->c:Ljava/lang/String;

    iput-object p6, p0, Lq98;->d:Lpxh;

    iput-object p7, p0, Lq98;->e:Lrxh;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lq98;
    .registers 2

    const-class v0, Lq98;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lq98;

    return-object p0
.end method

.method public static values()[Lq98;
    .registers 1

    sget-object v0, Lq98;->j:[Lq98;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lq98;

    return-object v0
.end method
