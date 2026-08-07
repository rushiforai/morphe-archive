.class public final synthetic Ll/bg00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jq2;


# direct methods
.method public synthetic constructor <init>(Ll/jq2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bg00;->a:Ll/jq2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bg00;->a:Ll/jq2;

    invoke-virtual {p0}, Ll/jq2;->i()V

    return-void
.end method
