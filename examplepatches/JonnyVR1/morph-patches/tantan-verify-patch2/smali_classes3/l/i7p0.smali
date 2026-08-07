.class public final synthetic Ll/i7p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v7p0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/v7p0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i7p0;->a:Ll/v7p0;

    iput-boolean p2, p0, Ll/i7p0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i7p0;->a:Ll/v7p0;

    iget-boolean p0, p0, Ll/i7p0;->b:Z

    check-cast p1, Ll/vak0;

    invoke-static {v0, p0, p1}, Ll/v7p0;->m4(Ll/v7p0;ZLl/vak0;)V

    return-void
.end method
