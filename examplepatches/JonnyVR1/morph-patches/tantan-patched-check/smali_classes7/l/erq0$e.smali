.class Ll/erq0$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/erq0;->z()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ivq0;

.field final synthetic b:Ll/erq0;


# direct methods
.method public constructor <init>(Ll/erq0;Ll/ivq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/erq0$e;->b:Ll/erq0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/erq0$e;->a:Ll/ivq0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/erq0$e;->a:Ll/ivq0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ivq0;->run()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
