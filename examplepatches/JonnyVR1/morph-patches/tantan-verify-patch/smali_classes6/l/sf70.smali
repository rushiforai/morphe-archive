.class public final synthetic Ll/sf70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wf70;


# direct methods
.method public synthetic constructor <init>(Ll/wf70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sf70;->a:Ll/wf70;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sf70;->a:Ll/wf70;

    invoke-static {p0}, Ll/wf70;->u(Ll/wf70;)V

    return-void
.end method
