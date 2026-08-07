.class public final synthetic Ll/wzk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VText_Tags;

.field public final synthetic b:Landroid/text/SpannableStringBuilder;


# direct methods
.method public synthetic constructor <init>(Lv/VText_Tags;Landroid/text/SpannableStringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wzk0;->a:Lv/VText_Tags;

    iput-object p2, p0, Ll/wzk0;->b:Landroid/text/SpannableStringBuilder;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wzk0;->a:Lv/VText_Tags;

    iget-object p0, p0, Ll/wzk0;->b:Landroid/text/SpannableStringBuilder;

    invoke-static {v0, p0}, Lv/VText_Tags;->l(Lv/VText_Tags;Landroid/text/SpannableStringBuilder;)V

    return-void
.end method
