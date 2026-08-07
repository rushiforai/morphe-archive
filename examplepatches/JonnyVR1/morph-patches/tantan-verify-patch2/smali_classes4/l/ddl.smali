.class public final synthetic Ll/ddl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tel;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I

.field public final synthetic d:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ll/tel;Ljava/lang/String;ILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ddl;->a:Ll/tel;

    iput-object p2, p0, Ll/ddl;->b:Ljava/lang/String;

    iput p3, p0, Ll/ddl;->c:I

    iput-object p4, p0, Ll/ddl;->d:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ddl;->a:Ll/tel;

    iget-object v1, p0, Ll/ddl;->b:Ljava/lang/String;

    iget v2, p0, Ll/ddl;->c:I

    iget-object p0, p0, Ll/ddl;->d:Landroid/content/Intent;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, v2, p0, p1}, Ll/tel;->A0(Ll/tel;Ljava/lang/String;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
