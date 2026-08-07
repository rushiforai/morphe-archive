.class public final synthetic Ll/gxy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hxy;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/hxy;Ljava/util/List;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gxy;->a:Ll/hxy;

    iput-object p2, p0, Ll/gxy;->b:Ljava/util/List;

    iput p3, p0, Ll/gxy;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gxy;->a:Ll/hxy;

    iget-object v1, p0, Ll/gxy;->b:Ljava/util/List;

    iget p0, p0, Ll/gxy;->c:I

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, v1, p0, p1}, Ll/hxy;->a(Ll/hxy;Ljava/util/List;ILandroid/util/Pair;)V

    return-void
.end method
