.class public final Ll/mu10$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mu10;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Z

.field public final b:Ll/kcg0;


# direct methods
.method public constructor <init>(ZLl/kcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/mu10$a;->a:Z

    .line 5
    .line 6
    iput-object p2, p0, Ll/mu10$a;->b:Ll/kcg0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/kcg0;)Ll/mu10$a;
    .locals 1

    .line 1
    new-instance v0, Ll/mu10$a;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/mu10$a;->a:Z

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/mu10$a;-><init>(ZLl/kcg0;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public b()Ll/mu10$a;
    .locals 2

    .line 1
    new-instance v0, Ll/mu10$a;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    iget-object p0, p0, Ll/mu10$a;->b:Ll/kcg0;

    .line 5
    .line 6
    invoke-direct {v0, v1, p0}, Ll/mu10$a;-><init>(ZLl/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
