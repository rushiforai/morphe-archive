.class public final synthetic Lj7d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt1f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lj7d;->a:B

    iput-object p1, p0, Lj7d;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 3

    iget-byte v0, p0, Lj7d;->a:B

    iget-object p0, p0, Lj7d;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_22

    check-cast p0, Lapl;

    iget-object p0, p0, Lapl;->b:Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    iput-boolean p1, p0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->e:Z

    invoke-virtual {p0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->a()V

    return-void

    :pswitch_11
    check-cast p0, Lk5o;

    iget-object p0, p0, Lk5o;->c:Ljava/lang/Object;

    check-cast p0, Lh13;

    iget-boolean v0, p0, Lh13;->d:Z

    if-eq p1, v0, :cond_20

    iput-boolean p1, p0, Lh13;->d:Z

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_20
    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
