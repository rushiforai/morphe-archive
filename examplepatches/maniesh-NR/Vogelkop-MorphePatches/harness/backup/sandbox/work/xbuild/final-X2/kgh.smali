.class public final Lkgh;
.super Luik;
.source "SourceFile"


# static fields
.field public static final c:Lbc6;


# instance fields
.field public b:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lbc6;

    const/16 v1, 0x10

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lbc6;-><init>(II)V

    filled-new-array {v0}, [Lbc6;

    move-result-object v0

    aget-object v0, v0, v2

    sput-object v0, Lkgh;->c:Lbc6;

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 3

    sget-object v0, Lkgh;->c:Lbc6;

    invoke-virtual {p1, v0}, Lbp;->Q(Lbc6;)Lbp;

    move-result-object p1

    iget p0, p0, Lkgh;->b:I

    const/16 v0, 0x8

    invoke-virtual {p1, p0, v0}, Lbp;->y(II)V

    return-void
.end method
