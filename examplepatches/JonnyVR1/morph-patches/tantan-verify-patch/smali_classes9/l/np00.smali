.class public final synthetic Ll/np00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pp00;


# direct methods
.method public synthetic constructor <init>(Ll/pp00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/np00;->a:Ll/pp00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/np00;->a:Ll/pp00;

    invoke-static {p0}, Ll/pp00;->b(Ll/pp00;)V

    return-void
.end method
