.class public final synthetic Ll/wzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Throwable;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Throwable;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wzg;->a:Ljava/lang/Throwable;

    iput-boolean p2, p0, Ll/wzg;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wzg;->a:Ljava/lang/Throwable;

    iget-boolean p0, p0, Ll/wzg;->b:Z

    invoke-static {v0, p0}, Ll/zzg;->b(Ljava/lang/Throwable;Z)V

    return-void
.end method
