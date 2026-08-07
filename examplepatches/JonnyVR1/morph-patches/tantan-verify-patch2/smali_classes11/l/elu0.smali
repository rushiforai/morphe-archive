.class public final synthetic Ll/elu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ilu0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/ilu0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/elu0;->a:Ll/ilu0;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/elu0;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/elu0;->a:Ll/ilu0;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/elu0;->b:Z

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/ilu0;->c0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
