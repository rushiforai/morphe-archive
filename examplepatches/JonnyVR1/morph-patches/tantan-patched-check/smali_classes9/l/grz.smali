.class public final synthetic Ll/grz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/grz;->a:Ll/tvz;

    iput-boolean p2, p0, Ll/grz;->b:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/grz;->a:Ll/tvz;

    iget-boolean p0, p0, Ll/grz;->b:Z

    invoke-static {v0, p0}, Ll/tvz;->w8(Ll/tvz;Z)V

    return-void
.end method
