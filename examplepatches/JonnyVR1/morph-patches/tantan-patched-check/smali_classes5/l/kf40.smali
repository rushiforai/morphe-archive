.class public final synthetic Ll/kf40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/kf40;->a:I

    iput p2, p0, Ll/kf40;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/kf40;->a:I

    iget p0, p0, Ll/kf40;->b:I

    check-cast p1, Lv/VListCell;

    invoke-static {v0, p0, p1}, Ll/mf40;->c(IILv/VListCell;)V

    return-void
.end method
