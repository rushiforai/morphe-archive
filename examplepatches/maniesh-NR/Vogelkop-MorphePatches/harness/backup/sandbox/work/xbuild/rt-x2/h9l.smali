.class public final synthetic Lh9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltvb;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Leme;

.field public final synthetic c:Lr9l;


# direct methods
.method public synthetic constructor <init>(Leme;Lr9l;B)V
    .registers 4

    iput-byte p3, p0, Lh9l;->a:B

    iput-object p1, p0, Lh9l;->b:Leme;

    iput-object p2, p0, Lh9l;->c:Lr9l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lh9l;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lh9l;->c:Lr9l;

    iget-object p0, p0, Lh9l;->b:Leme;

    packed-switch v0, :pswitch_data_1e

    sget-object v0, Lp6l;->b:Lp6l;

    invoke-virtual {p0, v0, v1}, Leme;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    invoke-virtual {v2}, Lr9l;->j()Z

    return-void

    :pswitch_13
    iget-object v0, v2, Lr9l;->t:Lgal;

    iget-object v0, v0, Lgal;->e:Lp6l;

    invoke-virtual {p0, v0, v1}, Leme;->j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;

    invoke-virtual {v2}, Lr9l;->j()Z

    return-void

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
