.class public final synthetic Ll/fu80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ou80;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/ou80;Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fu80;->a:Ll/ou80;

    iput-object p2, p0, Ll/fu80;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/fu80;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fu80;->a:Ll/ou80;

    iget-object v1, p0, Ll/fu80;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/fu80;->c:Ll/y20;

    invoke-static {v0, v1, p0}, Ll/ou80;->K(Ll/ou80;Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    return-void
.end method
