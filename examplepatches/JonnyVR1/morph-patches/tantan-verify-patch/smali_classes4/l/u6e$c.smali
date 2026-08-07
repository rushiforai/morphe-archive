.class public Ll/u6e$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u6e;->a(Ll/z1m;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/z1m;

.field public final synthetic b:Ll/u6e;


# direct methods
.method public constructor <init>(Ll/u6e;Ll/z1m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u6e$c;->b:Ll/u6e;

    .line 2
    .line 3
    iput-object p2, p0, Ll/u6e$c;->a:Ll/z1m;

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
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u6e$c;->b:Ll/u6e;

    .line 2
    .line 3
    invoke-static {v0}, Ll/u6e;->d(Ll/u6e;)Ll/ksl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/u6e$c;->a:Ll/z1m;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ll/ksl;->c(Ll/z1m;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
