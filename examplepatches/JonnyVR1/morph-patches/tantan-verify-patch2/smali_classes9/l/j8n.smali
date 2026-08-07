.class public final synthetic Ll/j8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o8n;


# direct methods
.method public synthetic constructor <init>(Ll/o8n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j8n;->a:Ll/o8n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j8n;->a:Ll/o8n;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/o8n;->c(Ll/o8n;Ljava/lang/Throwable;)V

    return-void
.end method
