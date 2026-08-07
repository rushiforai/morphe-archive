.class public final synthetic Ll/p5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x5f;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Lcom/clevertap/android/sdk/events/EventGroup;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/x5f;Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p5f;->a:Ll/x5f;

    iput-object p2, p0, Ll/p5f;->b:Landroid/content/Context;

    iput-object p3, p0, Ll/p5f;->c:Lcom/clevertap/android/sdk/events/EventGroup;

    iput-object p4, p0, Ll/p5f;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ll/p5f;->e:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p5f;->a:Ll/x5f;

    iget-object v1, p0, Ll/p5f;->b:Landroid/content/Context;

    iget-object v2, p0, Ll/p5f;->c:Lcom/clevertap/android/sdk/events/EventGroup;

    iget-object v3, p0, Ll/p5f;->d:Ljava/lang/String;

    iget-boolean p0, p0, Ll/p5f;->e:Z

    invoke-static {v0, v1, v2, v3, p0}, Ll/x5f;->j(Ll/x5f;Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/String;Z)V

    return-void
.end method
