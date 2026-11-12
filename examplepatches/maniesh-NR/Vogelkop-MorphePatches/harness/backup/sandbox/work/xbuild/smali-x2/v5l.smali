.class public final synthetic Lv5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz5l;

.field public final synthetic c:Lb2l;


# direct methods
.method public synthetic constructor <init>(Lz5l;Lb2l;B)V
    .registers 4

    iput-byte p3, p0, Lv5l;->a:B

    iput-object p1, p0, Lv5l;->b:Lz5l;

    iput-object p2, p0, Lv5l;->c:Lb2l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lv5l;->a:B

    iget-object v1, p0, Lv5l;->c:Lb2l;

    iget-object p0, p0, Lv5l;->b:Lz5l;

    packed-switch v0, :pswitch_data_20

    iget-object p0, p0, Lz5l;->v:Lx2l;

    iget-object p0, p0, Lx2l;->o:Lo2l;

    invoke-virtual {p0, v1}, Lo2l;->a(Lb2l;)I

    move-result p0

    :goto_11
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_16
    iget-object p0, p0, Lz5l;->v:Lx2l;

    iget-object p0, p0, Lx2l;->o:Lo2l;

    invoke-virtual {p0, v1}, Lo2l;->a(Lb2l;)I

    move-result p0

    goto :goto_11

    nop

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
