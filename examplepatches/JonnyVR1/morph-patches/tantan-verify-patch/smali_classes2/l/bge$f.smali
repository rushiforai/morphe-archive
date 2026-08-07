.class public Ll/bge$f;
.super Ll/ysi;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bge;-><init>(Ll/zsi;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Ll/zsi;

.field public final synthetic c:Ll/bge;


# direct methods
.method public constructor <init>(Ll/bge;Ljava/lang/String;Ll/zsi;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bge$f;->c:Ll/bge;

    .line 2
    .line 3
    iput-object p3, p0, Ll/bge$f;->b:Ll/zsi;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/ysi;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bge$f;->b:Ll/zsi;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zsi;->a()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bge$f;->b:Ll/zsi;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/zsi;->b(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
