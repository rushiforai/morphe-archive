.class public final synthetic Ll/vla;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bma;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/bma;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vla;->a:Ll/bma;

    iput-boolean p2, p0, Ll/vla;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vla;->a:Ll/bma;

    iget-boolean p0, p0, Ll/vla;->b:Z

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/bma;->f0(Ll/bma;ZLjava/lang/Throwable;)V

    return-void
.end method
