.class public final synthetic Ll/jvw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qvw;


# direct methods
.method public synthetic constructor <init>(Ll/qvw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jvw;->a:Ll/qvw;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jvw;->a:Ll/qvw;

    invoke-static {p0}, Ll/qvw;->b(Ll/qvw;)V

    return-void
.end method
