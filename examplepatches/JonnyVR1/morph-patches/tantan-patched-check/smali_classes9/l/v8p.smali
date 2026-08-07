.class public final synthetic Ll/v8p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/w8p;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/w8p;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v8p;->a:Ll/w8p;

    iput-boolean p2, p0, Ll/v8p;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v8p;->a:Ll/w8p;

    iget-boolean p0, p0, Ll/v8p;->b:Z

    invoke-static {v0, p0}, Ll/w8p;->P(Ll/w8p;Z)V

    return-void
.end method
