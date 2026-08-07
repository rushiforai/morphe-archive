.class public final synthetic Ll/es30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cs30;


# direct methods
.method public synthetic constructor <init>(Ll/cs30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/es30;->a:Ll/cs30;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/es30;->a:Ll/cs30;

    invoke-static {p0}, Ll/cs30$b;->a(Ll/cs30;)V

    return-void
.end method
