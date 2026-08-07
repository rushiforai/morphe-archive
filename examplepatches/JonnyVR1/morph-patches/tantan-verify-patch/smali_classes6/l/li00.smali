.class public final synthetic Ll/li00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hj00;


# direct methods
.method public synthetic constructor <init>(Ll/hj00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/li00;->a:Ll/hj00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/li00;->a:Ll/hj00;

    invoke-static {p0}, Ll/hj00;->m0(Ll/hj00;)V

    return-void
.end method
