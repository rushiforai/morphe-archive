.class public abstract Lv/VSlider$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cp50;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;ZF)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lv/VSlider$a;->c(Lv/VSlider;ZF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;ZFF)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lv/VSlider$a;->d(Lv/VSlider;ZFF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VSlider;ZF)V
    .locals 0
    .param p1    # Lv/VSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public d(Lv/VSlider;ZFF)V
    .locals 0
    .param p1    # Lv/VSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method
