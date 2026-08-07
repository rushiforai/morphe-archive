.class public final synthetic Ll/x5w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Landroid/widget/CheckBox;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLandroid/widget/CheckBox;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x5w;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/x5w;->b:Z

    iput-object p3, p0, Ll/x5w;->c:Landroid/widget/CheckBox;

    iput-object p4, p0, Ll/x5w;->d:Lcom/p1/mobile/android/app/Act;

    iput-object p5, p0, Ll/x5w;->e:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x5w;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/x5w;->b:Z

    iget-object v2, p0, Ll/x5w;->c:Landroid/widget/CheckBox;

    iget-object v3, p0, Ll/x5w;->d:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/x5w;->e:Ll/x20;

    invoke-static {v0, v1, v2, v3, p0}, Ll/c6w;->c(Ljava/lang/String;ZLandroid/widget/CheckBox;Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    return-void
.end method
