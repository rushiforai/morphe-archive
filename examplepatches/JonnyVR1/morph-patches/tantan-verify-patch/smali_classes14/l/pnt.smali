.class public final synthetic Ll/pnt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/rnt;

.field public final synthetic b:Ll/jlt;


# direct methods
.method public synthetic constructor <init>(Ll/rnt;Ll/jlt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pnt;->a:Ll/rnt;

    iput-object p2, p0, Ll/pnt;->b:Ll/jlt;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pnt;->a:Ll/rnt;

    iget-object p0, p0, Ll/pnt;->b:Ll/jlt;

    invoke-static {v0, p0}, Ll/rnt;->a(Ll/rnt;Ll/jlt;)V

    return-void
.end method
