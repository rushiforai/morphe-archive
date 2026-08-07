.class public final synthetic Ll/z8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/a9k;


# direct methods
.method public synthetic constructor <init>(Ll/a9k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z8k;->a:Ll/a9k;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8k;->a:Ll/a9k;

    invoke-static {p0}, Ll/a9k;->S3(Ll/a9k;)V

    return-void
.end method
