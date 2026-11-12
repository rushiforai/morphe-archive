.class public final synthetic Lsf8;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lcr9;


# static fields
.field public static final a:Lsf8;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Lsf8;

    const-string v4, "<init>(J[BJ)V"

    const/4 v5, 0x0

    const/4 v1, 0x3

    const-class v2, Lmf8;

    const-string v3, "<init>"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lsf8;->a:Lsf8;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    move-object v3, p2

    check-cast v3, [B

    check-cast p3, Ljava/lang/Number;

    invoke-virtual {p3}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    new-instance v0, Lmf8;

    invoke-direct/range {v0 .. v5}, Lmf8;-><init>(J[BJ)V

    return-object v0
.end method
