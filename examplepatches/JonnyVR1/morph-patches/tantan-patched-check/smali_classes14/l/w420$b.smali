.class public Ll/w420$b;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/w420;->q(Lcom/p1/mobile/putong/live/base/data/BLiveRoomInProfile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/w420;


# direct methods
.method public constructor <init>(Ll/w420;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w420$b;->a:Ll/w420;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/w420$b;->a:Ll/w420;

    .line 5
    .line 6
    iget-object p1, p0, Ll/w420;->k:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-static {p0, p1, p3, p2}, Ll/w420;->f(Ll/w420;Lv/VDraweeView;II)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
