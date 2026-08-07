.class public final synthetic Ll/ui60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vi60;


# direct methods
.method public synthetic constructor <init>(Ll/vi60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ui60;->a:Ll/vi60;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ui60;->a:Ll/vi60;

    invoke-static {p0}, Ll/vi60;->b(Ll/vi60;)V

    return-void
.end method
