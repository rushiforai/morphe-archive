.class public final synthetic Ll/xz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r00;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/r00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xz;->a:Ll/r00;

    iput-object p2, p0, Ll/xz;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xz;->a:Ll/r00;

    iget-object p0, p0, Ll/xz;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/r00;->d0(Ll/r00;Ljava/lang/String;)V

    return-void
.end method
