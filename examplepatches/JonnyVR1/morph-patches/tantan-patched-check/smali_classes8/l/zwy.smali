.class public final synthetic Ll/zwy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hxy;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/hxy;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zwy;->a:Ll/hxy;

    iput p2, p0, Ll/zwy;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zwy;->a:Ll/hxy;

    iget p0, p0, Ll/zwy;->b:I

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/hxy;->j(Ll/hxy;ILandroid/util/Pair;)V

    return-void
.end method
