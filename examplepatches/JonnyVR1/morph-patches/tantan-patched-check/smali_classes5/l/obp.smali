.class public final synthetic Ll/obp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/obp;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/obp;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/obp;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/obp;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/obp;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/obp;->c:Z

    invoke-static {v0, v1, p0}, Ll/ubp;->g(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Z)V

    return-void
.end method
