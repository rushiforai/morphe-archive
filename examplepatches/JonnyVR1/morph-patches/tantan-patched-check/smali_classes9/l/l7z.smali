.class public final synthetic Ll/l7z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/clz;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/clz;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l7z;->a:Ll/clz;

    iput-boolean p2, p0, Ll/l7z;->b:Z

    iput-boolean p3, p0, Ll/l7z;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l7z;->a:Ll/clz;

    iget-boolean v1, p0, Ll/l7z;->b:Z

    iget-boolean p0, p0, Ll/l7z;->c:Z

    invoke-static {v0, v1, p0}, Ll/nbz;->A1(Ll/clz;ZZ)V

    return-void
.end method
