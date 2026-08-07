.class public final synthetic Ll/bqm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/clevertap/android/sdk/inapp/a$a;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/clevertap/android/sdk/inapp/a;


# direct methods
.method public synthetic constructor <init>(ZLcom/clevertap/android/sdk/inapp/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/bqm;->a:Z

    iput-object p2, p0, Ll/bqm;->b:Lcom/clevertap/android/sdk/inapp/a;

    return-void
.end method


# virtual methods
.method public final a(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/bqm;->a:Z

    iget-object p0, p0, Ll/bqm;->b:Lcom/clevertap/android/sdk/inapp/a;

    invoke-static {v0, p0, p1}, Lcom/clevertap/android/sdk/inapp/a;->a(ZLcom/clevertap/android/sdk/inapp/a;Landroid/app/Activity;)V

    return-void
.end method
