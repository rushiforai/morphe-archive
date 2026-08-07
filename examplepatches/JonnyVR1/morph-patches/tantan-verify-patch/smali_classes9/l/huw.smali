.class public final synthetic Ll/huw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/vuw;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ll/vuw;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/huw;->a:Ll/vuw;

    iput-boolean p2, p0, Ll/huw;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/huw;->a:Ll/vuw;

    iget-boolean p0, p0, Ll/huw;->b:Z

    invoke-static {v0, p0}, Ll/vuw;->L3(Ll/vuw;Z)V

    return-void
.end method
