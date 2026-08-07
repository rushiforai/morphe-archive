.class public final Ll/loi$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/loi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation


# instance fields
.field public final a:Ll/loi$e;


# direct methods
.method public constructor <init>(Ll/loi$e;)V
    .locals 0
    .param p1    # Ll/loi$e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/loi$d;->a:Ll/loi$e;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/loi$e;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/loi$d;->a:Ll/loi$e;

    .line 2
    .line 3
    return-object p0
.end method
