.class public final synthetic Ll/hbi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jbi;


# direct methods
.method public synthetic constructor <init>(Ll/jbi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hbi;->a:Ll/jbi;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hbi;->a:Ll/jbi;

    invoke-static {p0}, Ll/jbi;->u0(Ll/jbi;)V

    return-void
.end method
