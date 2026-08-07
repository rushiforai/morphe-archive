.class public final synthetic Ll/hra;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ura;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/ura;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hra;->a:Ll/ura;

    iput-boolean p2, p0, Ll/hra;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hra;->a:Ll/ura;

    iget-boolean p0, p0, Ll/hra;->b:Z

    invoke-static {v0, p0}, Ll/ura;->i3(Ll/ura;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
