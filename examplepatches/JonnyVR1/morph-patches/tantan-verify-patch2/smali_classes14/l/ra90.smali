.class public final synthetic Ll/ra90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qa90;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/qa90;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ra90;->a:Ll/qa90;

    iput-boolean p2, p0, Ll/ra90;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ra90;->a:Ll/qa90;

    iget-boolean p0, p0, Ll/ra90;->b:Z

    invoke-static {v0, p0}, Ll/qa90$b;->a(Ll/qa90;Z)V

    return-void
.end method
