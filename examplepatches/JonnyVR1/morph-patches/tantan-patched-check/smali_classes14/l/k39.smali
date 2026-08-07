.class public final synthetic Ll/k39;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/k39;->a:Z

    iput-object p2, p0, Ll/k39;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/k39;->a:Z

    iget-object p0, p0, Ll/k39;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/f49;->l3(ZLjava/lang/String;)V

    return-void
.end method
